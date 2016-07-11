FROM elasticsearch:1.7.1
MAINTAINER David Reay <david@dcrbsltd.com>

# Install plugins cloud-aws for ec2 discovery
RUN /usr/share/elasticsearch/bin/plugin install elasticsearch/elasticsearch-cloud-aws/2.7.0

# head for viewing shard and replica information
RUN /usr/share/elasticsearch/bin/plugin --install mobz/elasticsearch-head

