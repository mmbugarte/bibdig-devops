.RECIPEPREFIX += 

install:
  echo Deploying ...

  rm -rf bibdig-cms bibdig-ui

  if [ ! -d bibdig-cms ]; then
    git clone https://github.com/mmbugarte/bibdig-cms.git
  else
    cd bibdig-cms
    git pull
    cd ..
    
  fi
  unzip ~/upload.zip bibdig-cms/.env

  if [ ! -d bibdig-ui ]; then
    git clone https://github.com/mmbugarte/bibdig-ui.git
  else
    cd bibdig-ui
    git pull
    cd ..
  fi

  cd devops
  sudo docker compose up 
  echo Deploy completed
