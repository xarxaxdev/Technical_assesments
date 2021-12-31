# Glovo - Data Engineer assessment

Welcome to the Glovo Data Engineer assessment, this assessment should take a few hours and will cover your Python and SQL skills.

The expected output for the problems are given, and you are required to provide working, readable and performant code to get this output.

## Starting the assessment

### Extract the provided tar.gz file
you should have been provided with a tar archive containing the assessment files (i.e. glovo\_assessment.tar.gz).

First extract the archive and enter the created directory using:

```bash
mkdir glovo_assessment
tar xzf glovo_assessment.tar.gz -C glovo_assessment
cd glovo_assessment
```

### Start the docker image

Then install docker on your platform - see https://www.docker.com/get-docker

And run the provided docker image using the following commands:

```bash
docker build . -t glovo_assessment
docker run -p 5432:5432 -p 80:80 glovo_assessment
```

Building the docker image for the first time will take up to 20 minutes depepnding on your CPU speed and Internet connection (it has to install postgres, numpy, etc.).

You can now connect to the Jupyter Python notebook with the assessment at http://127.0.0.1 and open the python\_assessment.ipynb file.

Save and export your completed notebook using File > Download as > Notebook - then send us this completed notebook.

## Terminating Docker

**Be sure to save and download your completed notebook before terminating the Docker instance**

You can terminate the Docker instance with:

```bash
docker ps | grep glovo_assessment | cut -f1 -d" "| xargs docker kill
```

## Notes

Note you can also edit the Jupyter notebook outside of the Docker image if you wish. The notebook is in the notebooks/ folder and the Postgres database is on port 5432.

If you don't want to use Docker at all, you can install Postgres separately and use the script in init.sql to fill the database.
# glovo_assessment-3
