<?php
/**
 * File
 *
 * PHP version 5
 *
 * @package App
 * @author  Renato França <renato@frannca.com>
 * @license Frannca. Todos os direitos reservados.
 * @link    http://frannca.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Arquivo
 *
 * @package App
 * @author  Renato França <renato@frannca.com>
 * @license Frannca. Todos os direitos reservados.
 * @link    http://frannca.com
 */
class File extends Model
{

    public function gerarImagem($base64, $pasta='general/')
    {
        $base64array = explode(',', str_replace(' ', '+', $base64));

        if (isset($base64array[1]) === true) {
            $dadosImagem = base64_decode($base64array[1]);
        } else {
            return '';
        }

        $nome    = date('YmdHis').'-'.uniqid().'.jpg';
        $caminho = '../public/images/';
        $imagem  = $caminho.$pasta.$nome;

        $this->criarPasta($imagem);

        $arquivo = fopen($imagem, 'wb');

        fwrite($arquivo, $dadosImagem);
        fclose($arquivo);

        $urlImagem = 'http://' . $_SERVER['SERVER_NAME'] . '/images/' . $pasta . $nome;

        return [
            'image' => $nome,
            'url' => $urlImagem
        ];

    }


    public function gerarThumbnail($imagem, $path='../public/thumbnails/', $percent=0.2)
    {
        $nome     = pathinfo($imagem, PATHINFO_FILENAME);
        $extensao = pathinfo($imagem, PATHINFO_EXTENSION);

        list($largura, $altura) = getimagesize($imagem);
        $novaLargura            = ($largura * $percent);
        $novaAltura             = ($altura * $percent);

        $thumb = imagecreatetruecolor($novaLargura, $novaAltura);
        $image = $this->criarImagemPeloTipo($imagem);
        imagecopyresampled($thumb, $image, 0, 0, 0, 0, $novaLargura, $novaAltura, $largura, $altura);

        imagejpeg($thumb, $path.$nome.'_thumb'.($percent * 100).'.'.$extensao, 80);

    }


    function criarImagemPeloTipo($path) {
        switch(mime_content_type($path)) {
            case 'image/png':
                $imagem = imagecreatefrompng($path);
                break;
            case 'image/gif':
                $imagem = imagecreatefromgif($path);
                break;
            case 'image/jpeg':
                $imagem = imagecreatefromjpeg($path);
                break;
            case 'image/bmp':
                $imagem = imagecreatefrombmp($path);
                break;
            default:
                $imagem = null;
        }
        return $imagem;
    }


    private function criarPasta($caminho)
    {
        $diretorio = dirname($caminho);

        if (!is_dir($diretorio))
        {
            mkdir($diretorio, 0755, true);
        }

    }

}
