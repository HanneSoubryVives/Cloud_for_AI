#Use a base image with Python and FastAPI installed
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

# Copy the application files and the model into the container
COPY ./main.py /app/main.py
COPY ./model.pkl /app/model.pkl

# install other packages
RUN pip install numpy
RUN pip install tensorflow
RUN pip install keras

# The command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
