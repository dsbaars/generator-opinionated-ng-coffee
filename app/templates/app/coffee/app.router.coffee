(->
    configure = ($stateProvider, $urlRouterProvider, $locationProvider) ->
        $locationProvider.html5Mode(true)
        $urlRouterProvider.otherwise("/")



        $stateProvider
            .state('main', {
                url: '/'
                templateUrl: '/templates/main.html'
                controller: 'MainController'
                controllerAs: 'vm'
            })

        return

    angular
        .module('app.router')
        .config(configure)
)()
