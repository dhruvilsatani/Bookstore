# Generated by Django 4.0.5 on 2022-12-15 06:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('data', '0011_remove_cart_book_cart_book'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cart',
            name='book',
        ),
        migrations.AddField(
            model_name='cart',
            name='book',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='data.books'),
            preserve_default=False,
        ),
    ]
