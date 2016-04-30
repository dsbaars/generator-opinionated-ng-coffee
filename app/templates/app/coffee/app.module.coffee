(->
    configure = ->
        return

    angular
        .module('app.router', [
    ])

    angular
        .module('app.directives', [
    ])

    angular
        .module('app.services', [
    ])

    angular
        .module('app', [
            'ngSanitize'
            'ngTouch'
            'ui.router'
            'ngAnimate'
            'app.router'
            'app.directives'
            'app.services'
            ])
        .config(configure)
        .constant('app', {
            })

)()
