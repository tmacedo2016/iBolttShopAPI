<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CompanyPayment extends Model
{

    /**
     * @var string
     */
    protected $table = 'CompaniesPayments';

    /**
     * @var array
     */
    protected $fillable = [
        'company_id',
        'payment_id',
        'name',
        'slug',
    ];

}
