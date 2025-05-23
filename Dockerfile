FROM continuumio/miniconda3

WORKDIR /app
COPY . /app

# Actualizar conda e instalar entorno con las librerías necesarias
RUN conda update -n base -c defaults conda -y && \
    conda create -n geo_env -c conda-forge -y python=3.9 \
    rsgislib geopandas matplotlib scikit-learn jupyter && \
    conda clean -afy

# Exponer el puerto
EXPOSE 8888

# Ejecutar jupyter notebook dentro del entorno geo_env
CMD ["/bin/bash", "-c", "source activate geo_env && jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root"]

