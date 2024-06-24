from flask import Flask, Response, request, url_for, jsonify, json
from typing import Collection, Dict, Text
import numpy as np
import tensorflow as tf
import sys
import tensorflow_datasets as tfds
import tensorflow_recommenders as tfrs
#from flask_pymongo import PyMongo
import pymongo
from pymongo import MongoClient


app = Flask(__name__)   
#app.config["MONGO_URI"] = "mongodb+srv://mohsen_nmz:4uauEh3JXggtDKhu@cluster0.hi1ah.mongodb.net/myFirstDatabase?retryWrites=true&w=majority"
#mongodb_client = PyMongo(app)

cluster = MongoClient("mongodb+srv://mohsen_nmz:vSBCsEyEGshcywjo@cluster0.hi1ah.mongodb.net/myFirstDatabase?retryWrites=true&w=majority")
db = cluster["UserActions"]
collection = db["Feedback"]


@app.route('/', methods = ['GET'])
def test():
    resp = Response(json.dumps({'res':'This will be the output of recommender system'}))
    resp.mimetype = 'text/xml'
    resp.headers['Access-Control-Allow-Origin'] = '*'
    resp.headers['Content-Type'] = 'application/json'
    resp.headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, Accept'
    resp.headers['Access-Control-Allow-Methods'] = 'GET, POST'
    resp.headers['Access-Control-Allow-Headers'] = 'X-Requested-With'
    return resp


@app.route('/sendFeedback', methods = ['GET'])
def sendToMongo():
 #   print('get data', file=sys.stderr)
    data = request.args
    country = data.to_dict(flat=False)['country'][0]
    feedback = data.to_dict(flat=False)['feedback'][0]
    collection.insert_one({"country":country, "feedback": feedback})
    resp = Response(json.dumps({'res':'successful'}))
    resp.mimetype = 'text/xml'
    resp.headers['Access-Control-Allow-Origin'] = '*'
    resp.headers['Content-Type'] = 'application/json'
    resp.headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, Accept'
    resp.headers['Access-Control-Allow-Methods'] = 'GET, POST'
    resp.headers['Access-Control-Allow-Headers'] = 'X-Requested-With'
    return resp



@app.route('/recommender', methods = ['GET'])
def recommender():
    # Ratings data.
    ratings = tfds.load('movielens/100k-ratings', split="train")
    # Features of all the available movies.
    movies = tfds.load('movielens/100k-movies', split="train")

    # Select the basic features.
    ratings = ratings.map(lambda x: {
        "movie_title": x["movie_title"],
        "user_id": x["user_id"]
    })
    movies = movies.map(lambda x: x["movie_title"])

    user_ids_vocabulary = tf.keras.layers.experimental.preprocessing.StringLookup(mask_token=None)
    user_ids_vocabulary.adapt(ratings.map(lambda x: x["user_id"]))

    movie_titles_vocabulary = tf.keras.layers.experimental.preprocessing.StringLookup(mask_token=None)
    movie_titles_vocabulary.adapt(movies)

    class MovieLensModel(tfrs.Model):
    # We derive from a custom base class to help reduce boilerplate. Under the hood,
    # these are still plain Keras Models.

        def __init__(
            self,
            user_model: tf.keras.Model,
            movie_model: tf.keras.Model,
            task: tfrs.tasks.Retrieval):
            super().__init__()

            # Set up user and movie representations.
            self.user_model = user_model
            self.movie_model = movie_model

            # Set up a retrieval task.
            self.task = task

        def compute_loss(self, features: Dict[Text, tf.Tensor], training=False) -> tf.Tensor:
            # Define how the loss is computed.

            user_embeddings = self.user_model(features["user_id"])
            movie_embeddings = self.movie_model(features["movie_title"])

            return self.task(user_embeddings, movie_embeddings)

    # Define user and movie models.
    user_model = tf.keras.Sequential([
        user_ids_vocabulary,
        tf.keras.layers.Embedding(user_ids_vocabulary.vocab_size(), 64)
    ])
    movie_model = tf.keras.Sequential([
        movie_titles_vocabulary,
        tf.keras.layers.Embedding(movie_titles_vocabulary.vocab_size(), 64)
    ])

    # Define your objectives.
    task = tfrs.tasks.Retrieval(metrics=tfrs.metrics.FactorizedTopK(
        movies.batch(128).map(movie_model)
    )
    )

    # Create a retrieval model.
    model = MovieLensModel(user_model, movie_model, task)
    model.compile(optimizer=tf.keras.optimizers.Adagrad(0.5))

    # Train for 3 epochs.
    model.fit(ratings.batch(4096), epochs=3)

    # Use brute-force search to set up retrieval using the trained representations.
    index = tfrs.layers.factorized_top_k.BruteForce(model.user_model)
    index.index(movies.batch(100).map(model.movie_model), movies)

    # Get some recommendations.
    _, titles = index(np.array(["42"]))
    resp = Response(json.dumps({'res':(f"Top 3 recommendations for user 42: {titles[0, :3]}")}))
    resp.mimetype = 'text/xml'
    resp.headers['Access-Control-Allow-Origin'] = '*'
    resp.headers['Content-Type'] = 'application/json'
    resp.headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, Accept'
    resp.headers['Access-Control-Allow-Methods'] = 'GET, POST'
    resp.headers['Access-Control-Allow-Headers'] = 'X-Requested-With'
    return resp

if __name__ == '__main__':
    port = 8000 #the custom port you want
    app.run(host='0.0.0.0', port=port)
    