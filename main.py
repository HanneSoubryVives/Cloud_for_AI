from fastapi import FastAPI
from pydantic import BaseModel
import pickle
import numpy as np

# Load the pretrained model
with open("model.pkl", "rb") as f:
    model = pickle.load(f)

# Create the app
app = FastAPI()

# Define endpoint
@app.post("/predict")
def predict(data: list[float]):
    print(data)
    data = np.array(data).reshape(1, -1)
    print(data)
    prediction = model.predict(data)
    print(prediction)
    return {"prediction": prediction.tolist()}
