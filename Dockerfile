####
#
# Inspired by https://quay.io/repository/gunnarmorling/hugo-builder
#
# Build the image with:
#
# docker build -t gamussa/my-hugo-builder .
#
# Then run the container using:
#
# docker run --rm -v $PWD:/src gamussa/my-hugo-builder bash -c "cd /src && /hugo/hugo server --buildDrafts --destination public -F"
#
###
#TODO from ruby:3.1.2
#FROM ruby:3.1.2
FROM ubuntu:22.04

#TODO: install via rbenv partibular version
RUN apt update && apt -y install wget ruby-full tar && apt clean
#RUN apt update && apt -y install wget tar && apt clean

RUN gem install --no-document asciidoctor rouge asciidoctor-html5s asciidoctor-rouge asciidoctor-diagram asciidoctor-bibtex

# Downloading latest manually as packages are a bit dated
#TODO get platform dependent binaries
RUN mkdir /hugo && cd /hugo && wget https://github.com/gohugoio/hugo/releases/download/v0.102.3/hugo_extended_0.102.3_Linux-64bit.tar.gz && tar xvf hugo_extended_0.102.3_Linux-64bit.tar.gz