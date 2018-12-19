<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class Payment extends Model
{

    /**
     * @var string
     */
    protected $table = 'Payments';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'slug',
    ];

    public function details() {
        return $this->hasOne('App\Models\OrderPayment');
    }

    public function companies() {
        return $this->belongsToMany('App\Models\Company', 'CompaniesPayments')->withTimestamps();
    }

    /**
     * @param $request
     * @return array
     */
    public function createPayment($request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
            ]
        );

        $arrayErrors = false;
        $fails       = $validator->fails();
        if ($fails === true) {
            $errors = $validator->errors()->messages();

            foreach ($errors as $key => $error) {
                $arrayErrors[]
                    = [
                    'field'   => $key,
                    'message' => $error[0],
                ];
            }
        }

        if ($arrayErrors === false) {
            $payment = new Payment();
            $payment->name = $request->input('name');
            $payment->slug = str_slug($request->input('name'), '-');
            $payment->save();

            $retorno = [
                $payment,
                201
            ];
        } else {
            $retorno = [
                [
                    'message' => 'Error',
                    'errors'  => $arrayErrors,
                ],
                422
            ];

        }

        return $retorno;

    }

    /**
     * @param $request
     * @return array
     */
    public function readPayments($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        $payments = new Payment();

        if (empty($ids) === true) {
            $payments = $payments->all();
        } else {
            $payments = $payments->whereIn('id', $ids)->get();
        }

        return [
            'data' => $payments,
            'status' => 200,
            'total' => count($payments)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readPayment($request, $id)
    {
        $payment = self::where('id', $id)->first();

        return [
            $payment,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editPayment($request, $id)
    {
        $validator = Validator::make(
            $request->all(), []
        );

        $arrayErrors = false;
        $fails       = $validator->fails();
        if ($fails === true) {
            $errors = $validator->errors()->messages();

            foreach ($errors as $key => $error) {
                $arrayErrors[]
                    = [
                    'field'   => $key,
                    'message' => $error[0],
                ];
            }
        }

        if ($arrayErrors === false) {
            $payment = self::where('id', $id)->first();
            if ($request->has('name')) {
                $payment->name = $request->input('name');
            }
            $payment->slug = str_slug($request->input('name'), '-');
            $payment->save();

            $retorno = [
                $payment,
                201
            ];
        } else {
            $retorno = [
                [
                    'message' => 'Error',
                    'errors'  => $arrayErrors,
                ],
                422
            ];

        }

        return $retorno;

    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function deletePayment($request, $id)
    {
        $payment = self::where('id', $id)->first();

        $payment->delete();

        return [
            $payment,
            200
        ];
    }

    public function getIdLike($ids)
    {
        $array = [];
        if (isset($ids) === true) {
            $array = explode('|', $ids);
        }

        return $array;
    }

    /**
     * @param $request
     * @return array
     */
    public function readCompanyPayments($request, $companyId)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        $company = Company::find($companyId);

        if (empty($company) === false) {
            $payments = $company->payments;

            if (empty($ids) === true) {
                $payments = $payments->all();
            } else {
                $payments = $payments->whereIn('id', $ids)->get();
            }
        } else {
            $payments = [];
        }

        return [
            'data' => $payments,
            'status' => 200,
            'total' => count($payments)
        ];
    }

    public function updateCompanyPayment($request, $companyId)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'ids' => 'required',
            ]
        );

        $arrayErrors = false;
        $fails       = $validator->fails();
        if ($fails === true) {
            $errors = $validator->errors()->messages();

            foreach ($errors as $key => $error) {
                $arrayErrors[]
                    = [
                    'field'   => $key,
                    'message' => $error[0],
                ];
            }
        }

        if ($arrayErrors === false) {

            $ids = $request->input('ids');
            $idsArray = explode('|', $ids);

            $company = new Company();
            $company = $company::find($companyId);

            $payments = new Payment();
            $payments = $payments::whereIn('id', $idsArray)->get();

            $paymentIds = [];
            foreach ($payments as $payment) {
                $paymentIds[] = $payment->id;
            }

            if (empty($company) === false) {
                $company->payments()->sync($paymentIds);
            } else {
                $payments = 'Company not found';
            }


            $retorno = [
                $payments,
                201
            ];
        } else {
            $retorno = [
                [
                    'message' => 'Error',
                    'errors'  => $arrayErrors,
                ],
                422
            ];

        }

        return $retorno;

    }

}
