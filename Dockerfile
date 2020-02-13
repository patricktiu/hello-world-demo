FROM ibmcom/websphere-traditional:latest-ubi
# put app and scripts and properties in /work/config
# put external library (e.g db driver) in /work/lib 
COPY --chown=was:root app.ear /work/config
COPY --chown=was:root install_app.py /work/config
COPY --chown=was:root was-config.props /work/config
RUN /work/configure.sh
