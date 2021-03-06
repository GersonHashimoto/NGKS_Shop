# Generated by Django 2.0.6 on 2018-10-14 02:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('catalogo', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CartItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cart_key', models.CharField(db_index=True, max_length=40, verbose_name='Chave do Carrinho')),
                ('quantidade', models.PositiveIntegerField(default=1, verbose_name='Quantidade')),
                ('preco', models.DecimalField(decimal_places=2, max_digits=8, verbose_name='Preço')),
                ('produto', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='catalogo.Produto', verbose_name='catalogo.produto')),
            ],
            options={
                'verbose_name': 'Item do Carrinho',
                'verbose_name_plural': 'Itens dos Carrinhos',
            },
        ),
    ]
