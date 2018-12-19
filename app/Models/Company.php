<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class Company extends Model
{

    /**
     * @var string
     */
    protected $table = 'Companies';

    /**
     * @var array
     */
    protected $fillable = [
        'fantasy',
        'balance',
        'socialName',
        'multiCompany',
        'cnpj',
        'phone',
        'responsible',
        'zipCode',
        'location',
        'address',
        'number',
        'district',
        'complement',
        'created_at',
        'updated_at',
        'user_id',
        'type_company_id',
        'city_id',
        'state_id',
        'country_id',
        'commercialPhone',
    ];

    public function products() {
        return $this->hasMany('App\Models\Product');
    }

    public function product() {
        return $this->hasOne('App\Models\Product');
    }

    public function orders() {
        return $this->hasMany('App\Models\Order');
    }

    public function payments() {
        return $this->belongsToMany('App\Models\Payment', 'CompaniesPayments')->withTimestamps();
    }

    /**
     * @param $request
     * @return array
     */
    public function createCompany($request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'fantasy' => 'required',
                'socialName' => 'required',
                'cnpj' => 'required',
                'phone' => 'required',
                'responsible' => 'required',
                'commercialPhone' => 'required',
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
            $transaction = DB::transaction(function () use ($request) {
                $company = new Company();
                $company->fantasy = $request->has('fantasy') ? $request->input('fantasy') : null;
                $company->balance = $request->has('balance') ? $request->input('balance') : null;
                $company->socialName = $request->has('socialName') ? $request->input('socialName') : null;
                $company->multiCompany = $request->has('multiCompany') ? $request->input('multiCompany') : null;
                $company->cnpj = $request->has('cnpj') ? $request->input('cnpj') : null;
                $company->phone = $request->has('phone') ? $request->input('phone') : null;
                $company->responsible = $request->has('responsible') ? $request->input('responsible') : null;
                $company->zipCode = $request->has('zipCode') ? $request->input('zipCode') : null;
                $company->location = $request->has('location') ? $request->input('location') : null;
                $company->address = $request->has('address') ? $request->input('address') : null;
                $company->number = $request->has('number') ? $request->input('number') : null;
                $company->district = $request->has('district') ? $request->input('district') : null;
                $company->complement = $request->has('complement') ? $request->input('complement') : null;
                $company->user_id = $request->has('user_id') ? $request->input('user_id') : null;
                $company->type_company_id = $request->has('type_company_id') ? $request->input('type_company_id') : null;
                $company->city_id = $request->has('city_id') ? $request->input('city_id') : null;
                $company->state_id = $request->has('state_id') ? $request->input('state_id') : null;
                $company->country_id = $request->has('country_id') ? $request->input('country_id') : null;
                $company->commercialPhone = $request->has('commercialPhone') ? $request->input('commercialPhone') : null;

                if ($request->has('email') && $request->has('password')) {
                    $user = new User();

                    $typeUser = new TypeUser();
                    $alias = 'empresa';
                    $typeUser = $typeUser->getTypeUser($alias);

                    if (isset($typeUser) === false) {
                        return [
                            [
                                "Type user $alias doesn't exist"
                            ],
                            422
                        ];
                    }
                    $user->types_user_id = $typeUser->id;
                    $user->name = $company->fantasy;
                    $user->number = 0;
                    $user->ddd = 0;
                    $user->ddi = 0;
                    $user->email = $request->input('email');
                    $user->password = md5($request->input('password'));
                    $user->save();

                    $company->user_id = $user->id;
                }

                $company->save();

                if ($request->has('email') && $request->has('password')) {
                    $company->user = $user;
                }

                return $company;
            });

            $retorno = [
                $transaction,
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
    public function readCompanies($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $companies = self::all();
        } else {
            $companies = self::whereIn('id', $ids)->get();
        }

        return [
            'data' => $companies,
            'status' => 200,
            'total' => count($companies)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readCompanyOrders($request, $id)
    {
        $company = self::where('id', $id)->with('orders')->first();

        return [
            $company,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readCompany($request, $id)
    {
        $company = self::where('id', $id)->first();

        return [
            $company,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editCompany($request, $id)
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
            $company = self::where('id', $id)->first();
            if ($request->has('fantasy')) {
                $company->fantasy = $request->input('fantasy');
            }
            if ($request->has('balance')) {
                $company->balance = $request->has('balance') ? $request->input('balance') : null;
            }
            if ($request->has('socialName')) {
                $company->socialName = $request->input('socialName');
            }
            if ($request->has('multiCompany')) {
                $company->multiCompany = $request->has('multiCompany') ? $request->input('multiCompany') : null;
            }
            if ($request->has('cnpj')) {
                $company->cnpj = $request->input('cnpj');
            }
            if ($request->has('phone')) {
                $company->phone = $request->input('phone');
            }
            if ($request->has('responsible')) {
                $company->responsible = $request->has('responsible') ? $request->input('responsible') : null;
            }
            if ($request->has('zipCode')) {
                $company->zipCode = $request->has('zipCode') ? $request->input('zipCode') : null;
            }
            if ($request->has('location')) {
                $company->location = $request->has('location') ? $request->input('location') : null;
            }
            if ($request->has('address')) {
                $company->address = $request->has('address') ? $request->input('address') : null;
            }
            if ($request->has('number')) {
                $company->number = $request->has('number') ? $request->input('number') : null;
            }
            if ($request->has('district')) {
                $company->district = $request->has('district') ? $request->input('district') : null;
            }
            if ($request->has('complement')) {
                $company->complement = $request->has('complement') ? $request->input('complement') : null;
            }
            if ($request->has('user_id')) {
                $company->user_id = $request->has('user_id') ? $request->input('user_id') : null;
            }
            if ($request->has('type_company_id')) {
                $company->type_company_id = $request->has('type_company_id') ? $request->input('type_company_id') : null;
            }
            if ($request->has('city_id')) {
                $company->city_id = $request->has('city_id') ? $request->input('city_id') : null;
            }
            if ($request->has('state_id')) {
                $company->state_id = $request->has('state_id') ? $request->input('state_id') : null;
            }
            if ($request->has('country_id')) {
                $company->country_id = $request->has('country_id') ? $request->input('country_id') : null;
            }
            if ($request->has('commercialPhone')) {
                $company->commercialPhone = $request->input('commercialPhone');
            }
            $company->save();

            $retorno = [
                $company,
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
    public function deleteCompany($request, $id)
    {
        $company = self::where('id', $id)->first();

        $company->delete();

        return [
            $company,
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

    public function getCompanyIdByUser($userId) {
        $company = self::where('user_id', $userId)->first();

        if (isset($company->id) === true) {
            return $company->id;
        }

        return null;
    }

}
