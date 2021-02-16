LIST:
We use ls commands to show the lists of buckets and content of buckets.
# List of buckets
aws s3 ls

# Contents of bucket
aws s3 ls s3://nilesh-test-today

# ls command will recursively list objects in a bucket and files inside the subfolders
aws s3 ls s3://nilesh-test-today/ --recursive


# ls command can also be human-readable and summarized
aws s3 ls s3://nilesh-test-today/ --recursive --human-readable --summarize

COPY:
The cp command is used to copy files from either local to a bucket or one bucket to another bucket.
# Copying a file from S3 to S3
aws s3 cp s3://nilesh-test-today/DB.txt s3://nilesh-test-tmrw
# If you want to give a new name in the destination bucket
aws s3 cp s3://nilesh-test-today/HCI.txt s3://nilesh-test-tmrw/NEWHCI.txt
# Copying an S3 object to local
aws s3 cp s3://nilesh-test-today/DB.txt MyFile.txt
# Copying a local file to S3
aws s3 cp MyFile.txt s3://nilesh-test-today
# Copying a local file to S3 with an expiration date
aws s3 cp test.txt s3://mybucket/test2.txt --expires 2014–10–01T20:30:00Z
# Recursively copying S3 objects (all contents of bucket) to a local directory
aws s3 cp s3://nilesh-test-today . -- recursive
# Recursively copying S3 objects to another bucket
aws s3 cp s3://mybucket/ s3://mybucket2/ --recursive

CREATE:
Create a bucket.
# Create a public bucket
aws s3 mb s3://xyz/
# create a bucket in a region
aws s3 mb s3://xyxyxyxyxyx --region us-west-1
MOVE:
mv is used to move files. Let’s see the difference between cp and mv.

# Difference between mv and cp
aws cp will copy a local file or S3 object to another location locally or in S3.
aws mv will move a local file or S3 object to another location locally or in S3. i.e. it will delete it from source and put it on the target path.

# Moves a single file to a specified bucket
aws s3 mv s3://nilesh-test-today/MyFile.txt s3://exmaple-today-bucket
PRE-SIGN:
Generate a pre-signed URL for an Amazon S3 object. This allows anyone who receives the pre-signed URL to retrieve the S3 object with an HTTP GET request.

# To create a pre-signed URL with the default one hour lifetime that links to an object in an S3 bucket
The following presign command generates a pre-signed URL for a specified bucket and that key is valid for one hour.
aws s3 presign s3://nilesh-test-today/MyFile.txt

# To create a pre-signed URL with a custom lifetime that links to an object in an S3 bucket
aws s3 presign s3://awsexamplebucket/test2.txt --expires-in 604800
RB:
Deletes an empty S3 bucket.

# Remove an empty bucket
aws s3 rb s3://exmaple-today-bucket

# Remove a non-empty bucket
aws s3 rb s3://exmaple-today-bucket --force
DELETE:
Delete the contents of a bucket.

# Delete a file
aws s3 rm s3://nilesh-test-today/HCI.txt

# Recursively deletes all objects
aws s3 rm s3://xyxyxyxyxyxyxyxyxxy --recursive

# Delete everything except but with excluded files
aws s3 rm s3://nilesh-test-today --recursive --exclude “*.jpg”
SYNC:
Syncs directories and S3 prefixes. Recursively copies new and updated files from the source directory to the destination.
Difference between AWS cp vs AWS sync
Using aws s3 cp will require the --recursive parameter to copy multiple files.
The aws s3 sync command will, by default, copy a whole directory. It will only copy new/modified files.
The sync command syncs objects under a specified prefix and bucket to files in a local directory by uploading the local files to S3. A local file will be uploaded if the size of the local file is different than the size of the S3 object, the last modified time of the local file is newer than the last modified time of the S3 object, or the local file does not exist under the specified bucket and prefix.

# Sync from local to a bucket
aws s3 sync . s3://mybucket
Website
Set the website configuration for a bucket.

# Configures a bucket named “my-bucket” as a static website
aws s3 website s3://my-bucket/ --index-document index.html --error-document error.html