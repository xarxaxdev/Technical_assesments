from django.shortcuts import render
from django.http import HttpResponse
from django.forms.models import model_to_dict
from django.views.decorators.csrf import csrf_exempt
from .models import File
import json,os
import boto3
from botocore.exceptions import ClientError

# Create your views here.
DEST_BUCKET = 'technicaltestaurea'


@csrf_exempt
def index(request):
    if request.method == 'GET':
       return HttpResponse("Hello, you should use a POST to send me stuff.")
    post = dict(request.POST)
    if 'file_name' in post and 'content' in post:
        url =post['file_name'] if type(post['file_name']) == type('a') else post['file_name'][0]
        content =post['content'] if type(post['content']) == type('a') else post['content'][0]
        f = File(url =url,content=content)
        f.save()
        saveAmazon(f)
        return HttpResponse("You posted something to the database.")
    return HttpResponse("Invalid parameters, was expecting 'file_name' and 'content'.")


def saveAmazon(instance):
    try:
        s3 = boto3.client('s3')
        s3.put_object(Bucket=DEST_BUCKET, Key=str(instance.id),Body=str(model_to_dict(instance)))
    except ClientError as e:
        logging.error(e)
        return False
    return



