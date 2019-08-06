#This script is used to get all open ingress rules of Security Group
import json
import boto3
import os

def getOpenSG(region):
    try:
        sg = boto3.client('ec2',region_name=region) #instantiate boto3 API for EC2 on a particular region endpoint
        response = sg.describe_security_groups() #Describe All Security groups present in a region
        for SG in response['SecurityGroups']: # Iterate through every Security Group
            for rule in SG['IpPermissions']: # Check each ingress rule in a Security group
                for cidr in rule['IpRanges']: 
                    if (cidr['CidrIp'] == '0.0.0.0/0'): #Look for CIDR open with 0.0.0.0/0 
                        print(SG['GroupName']+'\t'+SG['GroupId']+'\t'+cidr['CidrIp'])
    except Exception as e:
        print(e)

def lambda_handler(event, context):
    try:
        # You can define region here as hardcode as well
        region = os.environ['Region'] #Proivde a region in Environment variables of Lambda Function
        getOpenSG(region) # Function to get the Security groups
        return {
            'statusCode': 200
        }
    except Exception as e:
        print(e)