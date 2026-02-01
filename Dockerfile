#Use a base image with Python and FastAPI installed
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.10

# Copy the application files and the model into the container
COPY ./main.py /app/main.py
COPY ./model.pkl /app/model.pkl

# install other packages
RUN pip install --no-cache-dir numpy
RUN pip install --no-cache-dir tensorflow-cpu==2.16.*
RUN pip install --no-cache-dir keras==3.3.*

# The command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
