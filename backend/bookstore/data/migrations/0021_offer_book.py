# Generated by Django 4.0.5 on 2023-04-07 09:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('data', '0020_remove_orders_cart_orders_book_orders_quantity'),
    ]

    operations = [
        migrations.AddField(
            model_name='offer',
            name='book',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='data.books'),
            preserve_default=False,
        ),
    ]