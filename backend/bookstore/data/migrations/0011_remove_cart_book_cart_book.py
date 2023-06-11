# Generated by Django 4.0.5 on 2022-12-15 05:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('data', '0010_remove_cart_book_cart_book'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cart',
            name='book',
        ),
        migrations.AddField(
            model_name='cart',
            name='book',
            field=models.ManyToManyField(to='data.books'),
        ),
    ]
