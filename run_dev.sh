export PORT=3333
export FLASK_APP=utilities_for_me.web_app.server
export FLASK_ENV=development
flask --debug run \
    --debug \
    --host=0.0.0.0 \
    --port=$PORT
