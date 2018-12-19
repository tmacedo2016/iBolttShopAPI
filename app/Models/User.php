<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Lcobucci\JWT\Builder;
use Lcobucci\JWT\Signer\Hmac\Sha256;

class User extends Model
{

    /**
     * @var string
     */
    protected $table = 'Users';

    /**
     * @var array
     */
    protected $fillable = [
        'types_user_id',
        'name',
        'token',
        'forgot',
        'active',
        'number',
        'ddd',
        'ddi',
        'email',
        'master',
        'avatar',
        'alias',
        'password',
        'birthday',
        'cpf',
        'first',
        'status',
        'stage',
        'keyUpload',
    ];

    public function orders() {
        return $this->hasMany('App\Models\Order');
    }

    /**
     * @param $request
     * @return array
     */
    public function createUser($request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'number' => 'required',
                'ddd' => 'required',
                'ddi' => 'required',
                'email' => 'required',
                'status' => 'required',
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
            $user = new User();

            $typeUser = new TypeUser();
            $alias = 'user';
            $typeUser = $typeUser->getTypeUser($alias);
            $typeUserId = null;

            if (isset($typeUser->id) === true) {
                $typeUserId = $typeUser->id;
            }

            $user->types_user_id = $request->has('types_user_id') ? $request->input('types_user_id') : $typeUserId;
            $user->name = $request->has('name') ? $request->input('name') : null;
            $user->token = $request->has('token') ? $request->input('token') : null;
            $user->forgot = $request->has('forgot') ? $request->input('forgot') : null;
            $user->active = $request->has('active') ? $request->input('active') : null;
            $user->number = $request->has('number') ? $request->input('number') : null;
            $user->ddd = $request->has('ddd') ? $request->input('ddd') : null;
            $user->ddi = $request->has('ddi') ? $request->input('ddi') : null;
            $user->email = $request->has('email') ? $request->input('email') : null;
            $user->master = $request->has('master') ? $request->input('master') : null;
            $user->avatar = $request->has('avatar') ? $request->input('avatar') : null;
            $user->alias = $request->has('alias') ? $request->input('alias') : null;
            $user->password = $request->has('password') ? md5($request->input('password')) : null;
            $user->birthday = $request->has('birthday') ? $request->input('birthday') : null;
            $user->cpf = $request->has('cpf') ? $request->input('cpf') : null;
            $user->first = $request->has('first') ? $request->input('first') : null;
            $user->status = $request->has('status') ? $request->input('status') : null;
            $user->stage = $request->has('stage') ? $request->input('stage') : null;
            $user->keyUpload = $request->has('keyUpload') ? $request->input('keyUpload') : null;
            $user->save();

            $retorno = [
                $user,
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
    public function readUsers($request)
    {
        $idLike = isset($_GET['id_like']) ? $_GET['id_like'] : null;
        $ids = $this->getIdLike($idLike);

        if (empty($ids) === true) {
            $users = self::all();
        } else {
            $users = self::whereIn('id', $ids)->get();
        }

        return [
            'data' => $users,
            'status' => 200,
            'total' => count($users)
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readUser($request, $id)
    {
        $user = self::where('id', $id)->first();

        return [
            $user,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function readUserOrders($request, $id)
    {
        $user = self::where('id', $id)->with(['orders' => function($query) {
            $query->with('products');
        }])->first();

        $orders = isset($user->orders) === true ? $user->orders : [];

        return [
            $orders,
            200
        ];
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function editUser($request, $id)
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
            $user = self::where('id', $id)->first();
            if ($request->has('types_user_id')) {
                $user->types_user_id = $request->has('types_user_id') ? $request->input('types_user_id') : null;
            }
            if ($request->has('name')) {
                $user->name = $request->has('name') ? $request->input('name') : null;
            }
            if ($request->has('token')) {
                $user->token = $request->has('token') ? $request->input('token') : null;
            }
            if ($request->has('forgot')) {
                $user->forgot = $request->has('forgot') ? $request->input('forgot') : null;
            }
            if ($request->has('active')) {
                $user->active = $request->has('active') ? $request->input('active') : null;
            }
            if ($request->has('number')) {
                $user->number = $request->has('number') ? $request->input('number') : null;
            }
            if ($request->has('ddd')) {
                $user->ddd = $request->has('ddd') ? $request->input('ddd') : null;
            }
            if ($request->has('ddi')) {
                $user->ddi = $request->has('ddi') ? $request->input('ddi') : null;
            }
            if ($request->has('email')) {
                $user->email = $request->has('email') ? $request->input('email') : null;
            }
            if ($request->has('master')) {
                $user->master = $request->has('master') ? $request->input('master') : null;
            }
            if ($request->has('avatar')) {
                $user->avatar = $request->has('avatar') ? $request->input('avatar') : null;
            }
            if ($request->has('alias')) {
                $user->alias = $request->has('alias') ? $request->input('alias') : null;
            }
            if ($request->has('password')) {
                $user->password = $request->has('password') ? md5($request->input('password')) : null;
            }
            if ($request->has('birthday')) {
                $user->birthday = $request->has('birthday') ? $request->input('birthday') : null;
            }
            if ($request->has('cpf')) {
                $user->cpf = $request->has('cpf') ? $request->input('cpf') : null;
            }
            if ($request->has('first')) {
                $user->first = $request->has('first') ? $request->input('first') : null;
            }
            if ($request->has('status')) {
                $user->status = $request->has('status') ? $request->input('status') : null;
            }
            if ($request->has('stage')) {
                $user->stage = $request->has('stage') ? $request->input('stage') : null;
            }
            if ($request->has('keyUpload')) {
                $user->keyUpload = $request->has('keyUpload') ? $request->input('keyUpload') : null;
            }
            $user->save();

            $retorno = [
                $user,
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
    public function deleteUser($request, $id)
    {
        $user = self::where('id', $id)->first();

        $user->delete();

        return [
            $user,
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

    public function gerarToken($userId = null)
    {
        $signer = new Sha256();

        $token = (new Builder())
            ->setIssuer(env('TOKEN_ISSUER', 'http://iboltt.localhost'))
            ->setAudience(env('TOKEN_AUDIENCE', 'http://iboltt.localhost'))
            ->setId(env('TOKEN_ID', '6e4ca0dced8ff091780a3f13375642645960e0c6'))
            ->setIssuedAt(time())
            ->setNotBefore(time() + env('TOKEN_NOT_BEFORE_TIME', 60))
            ->setExpiration(time() + env('TOKEN_EXPIRATION_TIME', 3600))
            ->set('uid', $userId)
            ->sign($signer, env('TOKEN_SIGN', 'Iboltt'))
            ->getToken();

        return (string) $token;
    }

    public function login() {
        $user = Auth::user();

        if (isset($user->id) === true) {
            $token = $user->gerarToken($user->id);

            $company = new Company();
            $companyId = $company->getCompanyIdByUser($user->id);

            return [
                'data' => [
                    'token' => $token,
                    'id'    => $user->id,
                    'name'  => $user->name,
                    'email' => $user->email,
                    'types_user_id' => $user->types_user_id,
                    'company_id' => $companyId,
                ],
                'status' => 200
            ];
        }

        return [
            'data' => [],
            'status' => 400
        ];
    }

}
