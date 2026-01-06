import json

def handler(event, context):
    print("Hello World")
    return {
        'statusCode': 200,
        'body': json.dumps('Hello World from Lambda (Soumendu)!')
    }

if __name__ == "__main__":
    handler(None, None)

