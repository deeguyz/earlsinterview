from django.http import HttpResponse
from google.cloud import bigquery


def index(request):
    return HttpResponse("Hello, world.")

def hacker_news(request):
    # Construct a BigQuery client object.
    client = bigquery.Client()

    query = """
    SELECT title, author, time_ts  
    FROM `bigquery-public-data.hacker_news.stories` 
    ORDER BY time_ts DESC
    LIMIT 5
"""

    query_job = client.query(query)

    results = query_job.result()

    records = [dict(row) for row in query_job]

    return HttpResponse(records)

def github(request):
    client = bigquery.Client()

    query = """
    SELECT committer.name, COUNT(commit) as Number_of_Commits
    FROM `bigquery-public-data.github_repos.sample_commits` 
    WHERE committer.date >= '2016-01-01' AND  committer.date < '2017-01-01'
    GROUP BY committer.name
    ORDER BY COUNT(commit) DESC
"""

    query_job = client.query(query)

    results = query_job.result()

    records = [dict(row) for row in query_job]

    return HttpResponse(records)
