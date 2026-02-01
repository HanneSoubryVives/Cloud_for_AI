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
    data = np.array(input.data).reshape(1, -1)
    prediction = model.predict(data)
    return {"prediction": prediction}
