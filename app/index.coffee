util = require("util")
path = require("path")
glob = require("glob")
generators = require("yeoman-generator")
yosay = require("yosay")
_ = require('lodash-addons')
mkdirp = require('mkdirp')

OpinionatedNgCoffeeGenerator = generators.Base.extend(
    # paths: ->
    #   this.destinationRoot();
    #
    #   return

    initializing: ->
        @pkg = require("../package.json")
        return

    prompting: ->
        done = @async()

        # Have Yeoman greet the user.
        @log yosay("Welcome to the good OpinionatedNgCoffee generator!")
        prompts = [
            type: "input"
            name: 'pkgName',
            message: "Your project name"
            default : _.slugify(@appname)
        ]
        @prompt prompts, ((props) =>

            @pkgName = props.pkgName

            done()
            return
        ).bind(this)

        ###
        # @todo Add prompt for grunt/gulp
        ###

        return

    writing: ->
      #  app: ->
        console.log('writing call', @destinationRoot())

        mkdirp "app"
        mkdirp "public"
        mkdirp "gulp"
        mkdirp "config"
        # @destinationRoot().mkdir "app/less"
        # @destinationRoot().mkdir "app/coffee"
        # @sourceRoot().copy "app/coffee/app.coffee", "app/coffee/app.coffee"
        # @sourceRoot().copy "app/less/app.less", "app/less/app.less"
        # @sourceRoot().copy "app/less/variables.less", "app/less/variables.less"
        @fs.copy @templatePath('app/**'), 'app'
        @fs.copy @templatePath('config/**'), 'config'
        @fs.copy @templatePath('gulp/**'), 'gulp'
        @fs.copy @templatePath('public/**'), 'public'

        @fs.copyTpl @templatePath('_package.json'), "package.json", {pkgName: @pkgName }
        @fs.copyTpl @templatePath('_bower.json'), "bower.json", {pkgName: @pkgName }
        @fs.copyTpl @templatePath('gitignore'), ".gitignore"
        @fs.copyTpl @templatePath('Gruntfile.coffee'), "Gruntfile.coffee"
        @fs.copyTpl @templatePath('editorconfig'), ".editorconfig"
        @fs.copyTpl @templatePath('jshintrc'), ".jshintrc"
        @fs.copyTpl @templatePath('coffeelint.json'), "coffeelint.json"
        @fs.copyTpl @templatePath('gulpfile.js'), "gulpfile.js"

        return

    install: ->
        @installDependencies({
            callback: =>
                @spawnCommand('grunt', [])
                return
            })
        return
)
module.exports = OpinionatedNgCoffeeGenerator
