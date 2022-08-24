# Importing packages
from flask_cors import CORS
from flask import Flask, jsonify, request
from flask_restful import Api, Resource

# Creating the app
app = Flask(__name__)

# Initiating the API
api = Api(app)
CORS(app, resources={r"/*": {"origins": "*"}})

class SimpleFlaskAPI(Resource):
    """
        Class holding the structure and functions needed for the API     
    """ 

    # Constructor of anomaly class
    def __init__(self):
        '''
        Constructor to initialize variables in the flask service
        '''
        pass

    def get(self):
        return jsonify("Hello from the FLASK GET API")

    def post(self):
        return jsonify("Hello from the FLASK POST API")

@app.after_request
def after_request(response):
    '''
    Function to perform action after the request is processed

    Input Parameter:
        response: Flask response variable, passed by the falsk application during runtime.

    Output Parameter:
        response: Flask response variable, passed by the falsk application during runtime

    '''
    # Adding headers after the serving the API request
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
    response.headers.add('Access-Control-Max-Age', '86400')
    return response

# Initializing the app service
api.add_resource(SimpleFlaskAPI, "/apirequest")
app.run(host='0.0.0.0', port=5005)