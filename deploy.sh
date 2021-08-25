
# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd docs

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

#git init
#git add .
git status
git add -u
git commit -am "deploy"
#git commit -m 'deploy'
git push -f origin master
# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git main

# if you are deploying to https://<USERNAME>.github.io/<REPO>
#git push -f git@github.com:jjcampis/onesignal.git main:gh-pages

#cd -