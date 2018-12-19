<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {

    return 'Iboltt Food - <a href="https://documenter.getpostman.com/view/1034419/RzZ9GeT8">Documentação</a>';
});

$router->group(['prefix' => 'v1'], function () use ($router) {

    /**
     * Login
     */
    $router->post('/login', ['middleware' => 'auth', 'uses' => 'UserController@login']);

    /**==================================================
     * Aplicativo
     *
     * Rotas utilizadas pelo usuário
     **==================================================*/

    /**
     * Orders
     */
    // Faz o pedido do usuário
    $router->post('/companies/{companyId}/users/{userId}/orders', ['uses' => 'OrderController@createOrder']);
    // Retorna os pedidos do usuário
    $router->get('/users/{userId}/orders', ['uses' => 'OrderController@readOrders']);
    // Retorna um pedido específico do usuário
    $router->get('/users/{userId}/orders/{id}', ['uses' => 'OrderController@readOrder']);
    // Retorna os produtos de um pedido do usuário
    $router->get('/users/{userId}/orders/{id}/products', ['uses' => 'OrderController@readOrderProducts']);
    // Cancela um pedido
    $router->put('/users/{userId}/orders/{id}/cancelar', ['uses' => 'OrderController@cancelOrder']);

    /**==================================================
     * Web
     *
     * Rotas utilizadas pela empresa
     **==================================================*/

    /**
     * Orders
     */
    // Retorna os pedidos da empresa
    $router->get('/companies/{companyId}/orders', ['uses' => 'OrderController@readCompanyOrders']);
    // Retorna um pedido específico da empresa
    $router->get('/companies/{companyId}/orders/{id}', ['uses' => 'OrderController@readCompanyOrder']);
    // Retorna os produtos de um pedido
    $router->get('/companies/{companyId}/orders/{id}/products', ['uses' => 'OrderController@readCompanyOrderProducts']);
    // Atualiza os dados de um pedido
    $router->put('/companies/{companyId}/orders/{id}', ['uses' => 'OrderController@editCompanyOrder']);
    // Atualiza o status de um pedido
    $router->put('/companies/{companyId}/orders/{orderId}/status/{id}', ['uses' => 'OrderController@editCompanyOrderStatus']);

    /**
     * Payments
     */
    // Adiciona uma nova forma de pagamento
    $router->put('/companies/{companyId}/payments', ['uses' => 'PaymentController@updateCompanyPayment']);
    // Retorna os pagamentos de uma empresa
    $router->get('/companies/{id}/payments', ['uses' => 'PaymentController@readCompanyPayments']);

    /**==================================================
     * Admin
     *
     * Rotas utilizadas pela administração
     **==================================================*/

    /**
     * Payments
     */
    // Adiciona uma nova forma de pagamento
    $router->post('/payments', ['uses' => 'PaymentController@createPayment']);
    // Retorna os pagamentos de uma empresa
    $router->get('/payments', ['uses' => 'PaymentController@readPayments']);
    // Retorna um pagamento específico da empresa
    $router->get('/payments/{id}', ['uses' => 'PaymentController@readPayment']);
    // Atualiza os dados de um pagamento
    $router->put('/payments/{id}', ['uses' => 'PaymentController@editPayment']);
    // Deleta um pagamento
    $router->delete('/payments/{id}', ['uses' => 'PaymentController@deletePayment']);

    /**
     * Order Status
     */
    // Adiciona um novo status
    $router->post('/status', ['uses' => 'OrderStatusController@createOrderStatus']);
    // Retorna os status
    $router->get('/status', ['uses' => 'OrderStatusController@readOrderStatusList']);
    // Retorna um status
    $router->get('/status/{id}', ['uses' => 'OrderStatusController@readOrderStatus']);
    // Atualiza um status
    $router->put('/status/{id}', ['uses' => 'OrderStatusController@editOrderStatus']);
    // Deleta um status
    $router->delete('/status/{id}', ['uses' => 'OrderStatusController@deleteOrderStatus']);

    /**
     * Companies
     */
    $router->group(['prefix' => 'companies'], function () use ($router) {
        // Create
        $router->post('/', ['uses' => 'CompanyController@createCompany']);
        // Read
        $router->get('/', ['uses' => 'CompanyController@readCompanies']);
        $router->get('/{id}', ['uses' => 'CompanyController@readCompany']);
        // Update
        $router->put('/{id}', ['uses' => 'CompanyController@editCompany']);
        // Delete
        $router->delete('/{id}', ['uses' => 'CompanyController@deleteCompany']);

        /**
         * Categories
         */
        $router->group(['prefix' => '{companyId}/categories'], function () use ($router) {
            // Create
            $router->post('/', ['uses' => 'CategoryProductController@createCategoryProduct']);
            // Read
            $router->get('/', ['uses' => 'CategoryProductController@readCategoryProducts']);
            $router->get('/{id}', ['uses' => 'CategoryProductController@readCategoryProduct']);
            // Update
            $router->put('/{id}', ['uses' => 'CategoryProductController@editCategoryProduct']);
            // Delete
            $router->delete('/{id}', ['uses' => 'CategoryProductController@deleteCategoryProduct']);
        });

        /**
         * Products
         */
        $router->group(['prefix' => '{companyId}/products'], function () use ($router) {
            // Create
            $router->post('/', ['uses' => 'ProductController@createProduct']);
            // Read
            $router->get('/', ['uses' => 'ProductController@readProducts']);
            $router->get('/{id}', ['uses' => 'ProductController@readProduct']);
            // Update
            $router->put('/{id}', ['uses' => 'ProductController@editProduct']);
            // Delete
            $router->delete('/{id}', ['uses' => 'ProductController@deleteProduct']);
        });

    });

    /**
     * Type Companies
     */
    $router->group(['prefix' => 'type-companies'], function () use ($router) {
        // Create
        $router->post('/', ['uses' => 'TypeCompanyController@createTypeCompany']);
        // Read
        $router->get('/', ['uses' => 'TypeCompanyController@readTypeCompanies']);
        $router->get('/{id}', ['uses' => 'TypeCompanyController@readTypeCompany']);
        // Update
        $router->put('/{id}', ['uses' => 'TypeCompanyController@editTypeCompany']);
        // Delete
        $router->delete('/{id}', ['uses' => 'TypeCompanyController@deleteTypeCompany']);
    });

    /**
     * Countries
     */
    $router->group(['prefix' => 'countries'], function () use ($router) {
        // Create
        $router->post('/', ['uses' => 'CountryController@createCountry']);
        // Read
        $router->get('/', ['uses' => 'CountryController@readCountries']);
        $router->get('/{id}', ['uses' => 'CountryController@readCountry']);
        // Update
        $router->put('/{id}', ['uses' => 'CountryController@editCountry']);
        // Delete
        $router->delete('/{id}', ['uses' => 'CountryController@deleteCountry']);
    });

    /**
     * States
     */
    $router->group(['prefix' => 'states'], function () use ($router) {
        // Create
        $router->post('/', ['uses' => 'StateController@createState']);
        // Read
        $router->get('/', ['uses' => 'StateController@readStates']);
        $router->get('/{id}', ['uses' => 'StateController@readState']);
        // Update
        $router->put('/{id}', ['uses' => 'StateController@editState']);
        // Delete
        $router->delete('/{id}', ['uses' => 'StateController@deleteState']);
    });

    /**
     * Cities
     */
    $router->group(['prefix' => 'cities'], function () use ($router) {
        // Create
        $router->post('/', ['uses' => 'CityController@createCity']);
        // Read
        $router->get('/', ['uses' => 'CityController@readCities']);
        $router->get('/{id}', ['uses' => 'CityController@readCity']);
        // Update
        $router->put('/{id}', ['uses' => 'CityController@editCity']);
        // Delete
        $router->delete('/{id}', ['uses' => 'CityController@deleteCity']);
    });

    /**
     * Users
     */
    $router->group(['prefix' => 'users'], function () use ($router) {
        // Create
        $router->post('/', ['uses' => 'UserController@createUser']);
        // Read
        $router->get('/', ['uses' => 'UserController@readUsers']);
        $router->get('/{id}', ['uses' => 'UserController@readUser']);
        // Update
        $router->put('/{id}', ['uses' => 'UserController@editUser']);
        // Delete
        $router->delete('/{id}', ['uses' => 'UserController@deleteUser']);
    });

    /**
     * Type Users
     */
    $router->group(['prefix' => 'type-users'], function () use ($router) {
        // Create
        $router->post('/', ['uses' => 'TypeUserController@createTypeUser']);
        // Read
        $router->get('/', ['uses' => 'TypeUserController@readTypeUsers']);
        $router->get('/{id}', ['uses' => 'TypeUserController@readTypeUser']);
        // Update
        $router->put('/{id}', ['uses' => 'TypeUserController@editTypeUser']);
        // Delete
        $router->delete('/{id}', ['uses' => 'TypeUserController@deleteTypeUser']);
    });

    /**
     * Types Shops
     */
    $router->group(['prefix' => 'types-shops'], function () use ($router) {
        // Create
        $router->post('/', ['uses' => 'TypeShopController@createTypeShop']);
        // Read
        $router->get('/', ['uses' => 'TypeShopController@readTypeShops']);
        $router->get('/{id}', ['uses' => 'TypeShopController@readTypeShop']);
        // Update
        $router->put('/{id}', ['uses' => 'TypeShopController@editTypeShop']);
        // Delete
        $router->delete('/{id}', ['uses' => 'TypeShopController@deleteTypeShop']);
    });

    /**
     * Categories Products
     */
    $router->group(['prefix' => 'categories-products'], function () use ($router) {
        // Create
        $router->post('/', ['uses' => 'CategoryProductController@createCategoryProduct']);
        // Read
        $router->get('/', ['uses' => 'CategoryProductController@readCategoryProducts']);
        $router->get('/{id}', ['uses' => 'CategoryProductController@readCategoryProduct']);
        // Update
        $router->put('/{id}', ['uses' => 'CategoryProductController@editCategoryProduct']);
        // Delete
        $router->delete('/{id}', ['uses' => 'CategoryProductController@deleteCategoryProduct']);
    });

});
