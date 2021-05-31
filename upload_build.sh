#!/bin/bash
#!/bin/bash

TARGET_BUCKET='pokeclicker.barnyak.com'

echo "Running uploader...."

while true; do
    read -p "Your in the AWS environment ${AWS_PREFIX} are you sure you want to run this?" yn
    case $yn in
        [Yy]* ) aws s3 cp ./build s3://${TARGET_BUCKET}/ --recursive --acl public-read; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Building cloudfront invalidation..."

aws cloudfront create-invalidation --distribution-id E2WRFMR5TQYKY2 --paths '/*'

echo "Done"
