from googleapiclient import discovery
import json

compute = discovery.build('compute', 'v1')
result = compute.instances().list(project='fake-projectname-31337', zone='europe-west1-b').execute()
inventory = {
    instance['name'].replace('-', '_'): {
        'hosts': instance['networkInterfaces'][0]['accessConfigs'][0]['natIP']
    }
    for instance in result['items']
    if instance.get("status") == 'RUNNING'
}

with open('inventory.json', 'w') as outfile:
    json.dump(inventory, outfile, indent=4)
