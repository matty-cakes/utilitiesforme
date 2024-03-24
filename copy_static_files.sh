echo "building frontend assets"                                                                                                                                                                                                                        
cd frontend
npm i
npm run build
cd ..

echo "deleting current --> ./utilities_for_me/web_app/static"
rm -rf ./utilities_for_me/web_app/static

echo "recreating --> ./utilities_for_me/web_app/static"
mkdir -p ./utilities_for_me/web_app/static

echo "copying frontend static assets --> ./utilities_for_me/web_app/static"
cp -R frontend/dist/ ./utilities_for_me/web_app/static