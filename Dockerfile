# Mount your credentials in ~/.aws to /aws
# Put this at the end of .bashrc:
#function aws() {
#        docker run -it \
#                -v C:/Users/tlhavlik/.aws:/aws \
#                thavlik/awscli \
#                aws $@
#}
# Then run `source ~/.bashrc`
# You should be able to use the `aws` command normally
FROM python:3.7-stretch
WORKDIR /pipinstall
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN rm -rf /pipinstall
RUN pip install awscli
RUN export AWS_CONFIG_FILE=/aws/config
RUN export AWS_SHARED_CREDENTIALS_FILE=/aws/credentials
VOLUME /aws
