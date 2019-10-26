#!/usr/bin/env bash
curl -o dogs.jpg https://raw.githubusercontent.com/awslabs/mxnet-model-server/master/docs/images/3dogs.jpg
curl -o soccer.png https://github.com/dmlc/web-data/blob/master/gluoncv/pose/soccer.png?raw=true
./gradlew run -Dmain=ai.djl.examples.inference.ClassifyExample --args="-i dogs.jpg -c 1000 -r {'layers':'18','flavor':'v1'}" &> res18.log
./gradlew run -Dmain=ai.djl.examples.inference.ClassifyExample --args="-i dogs.jpg -c 1000 -r {'layers':'50','flavor':'v2'}" &> res50.log
./gradlew run -Dmain=ai.djl.examples.inference.ClassifyExample --args="-i dogs.jpg -c 1000 -r {'layers':'152','flavor':'v1d'}" &> res152.log
./gradlew run -Dmain=ai.djl.examples.inference.SsdExample --args="-i soccer.png -c 1000 -r {'size':'512','backbone':'resnet50_v1'}" &> ssdresnet50.log
./gradlew run -Dmain=ai.djl.examples.inference.SsdExample --args="-i soccer.png -c 1000 -r {'size':'512','backbone':'vgg16'}" &> ssdvgg16.log
./gradlew run -Dmain=ai.djl.examples.inference.BertQaInferenceExample --args="-c 1000 -r {'backbone':'bert'}" &> bertqa.log