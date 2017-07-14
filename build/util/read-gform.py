import os
import csv

project             = raw_input("Project ID (build-172714): ")
filepath            = raw_input("Path to GCPTerraform.csv (Example /Users/nielsen.pierce/Downloads/GCPTerraform.csv): ")

with open(filepath,'r') as f:
    reader          = csv.DictReader(f, delimiter=',')
    rows            = list(reader)

for row in rows:
   region           = row['Region']
   zone             = row['Zone']
   platform         = row['Platform Name']
   autoscaler       = row['Autoscaler Name']
   machinetype      = row['Machine Type']
   lbname           = row['Load Balancer name']
   cidr             = row['CIDR Range']
   gmgr             = row['Group manager name']
   gmgrzone         = row['Group manager zone']
   smax             = row['Scaling Max']
   smin             = row['Scaling Min']


file = open("variables.tf","w")

file.write('# Network\n\n')
file.write('variable "poc-region"               { default = "%s" }\n' %(region))
file.write('variable "poc-zone"                 { default = "%s" }\n' %(zone))
file.write('variable "poc-project"              { default = "%s" }\n' %(project))
file.write('variable "platform-name"            { default = "%s"  }\n' %(platform))
file.write('variable "iprange"                  { default = "%s"  }\n' %(cidr))

file.write('\n')
file.write('#asg\n')
file.write('variable "asg_name"                 { default = "%s" }\n' %(autoscaler))
file.write('variable "instance_type"            { default = "%s" }\n' %(machinetype))
file.write('variable "pool_name"                { default = "%s" }\n' %(lbname))
file.write('variable "group_manager_name"       { default = "%s" }\n' %(gmgr))
file.write('variable "group_manager_zone"       { default = "%s" }\n' %(gmgrzone))
file.write('variable "autoscaler_name"          { default = "%s" }\n' %(autoscaler))
file.write('variable "autoscaler_zone"          { default = "%s" }\n' %(zone))
file.write('variable "max"                      { default = %s }\n' %(smax))
file.write('variable "min"                      { default = %s }\n' %(smin))
file.write('variable "cooldown"                 { default = 60 }\n')
file.write('\n')
file.write('#key pair\n')
file.write('variable "public_key_path"          { default = "~/.ssh/gcloud_id_rsa.pub" }\n')
file.write('variable "private_key_path"         { default = "~/.ssh/gcloud_id_rsa" }\n')

file.close()
