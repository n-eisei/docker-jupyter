FROM ubuntu:22.04

# base install
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y --no-install-recommends \
    # vscode requirements
    gnome-keyring wget curl ca-certificates \
    # development tools
    git python3-pip \
    # clean up
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# install editors
RUN apt-get update && apt-get install vim  emacs -y

# install jupyter
RUN pip3 install Jupyter jupyterlab pandas numpy Scipy

# entrypoint
CMD [ "jupyter-lab", "--ip='0.0.0.0'", "--port=8188", "--allow-root", "--LabApp.default_url='lab?file-browser-path=/root'" ,"--NotebookApp.token=''", "--no-browser" ]

# expose port
EXPOSE 8188
