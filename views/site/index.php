<?php

/* @var $this yii\web\View */
use yii\widgets\Pjax;
use yii\helpers\Html;
$this->title = 'My Yii Application';
?>
<div class="site-index">
    
    <? if(!Yii::$app->user->isGuest) : ?>

    <? Pjax::begin(['id' => 'requestsCount']); ?>

        <?= '<h1>Принято заявок: '.$count.'</h1>'?>

    <? Pjax::end(); ?>
    <?php
        $js = <<< JS
        setInterval(() => {
            $.pjax.reload({container: "#requestsCount", async: false});
        }, 5000);
        JS;
        $this->registerJs($js);
    ?>
    <p>
        <?= \yii\helpers\Html::a('Создать запрос', ['/front/create'], ['class' => 'btn btn-success']) ?>
    </p>

    <? endif ?>
        <div class='card-deck'>

    <? foreach ($request as $key => $item) : ?>
    <?=
        '<div class="card" style="width: 50rem;">
        <img class="card-img-top before_img after_img" src="/'.$item['after_img'].'" alt="Card image cap">
        <img class="card-img-top before_img" src="/'.$item['before_img'].'" alt="Card image cap">
        <div class="card-body">
            <h3 class="card-title">'.$item['name'].'</h3>
            <p class="card-text">Категория: '.$item['category']['name'].'</p>
            <p class="card-text text-muted">Дата: '.$item['created_at'].'</p>
        </div>
        </div>'
    ?>
        <? if($key == '1') : echo "</div><div class='card-deck'>"; endif; ?>
    <? endforeach; ?>

        </div>
</div>
