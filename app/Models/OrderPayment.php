<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderPayment extends Model
{

    /**
     * @var string
     */
    protected $table = 'OrdersPayments';

    /**
     * @var array
     */
    protected $fillable = [
        'order_id',
        'payment_id',
        'value',
    ];

}
