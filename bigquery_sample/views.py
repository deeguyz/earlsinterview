from django.http import HttpResponse
from google.cloud import bigquery


def index(request):
    return HttpResponse("Hello, world.")

def hacker_news(request):
    return HttpResponse(200)

def github(request):
    return HttpResponse(200)
