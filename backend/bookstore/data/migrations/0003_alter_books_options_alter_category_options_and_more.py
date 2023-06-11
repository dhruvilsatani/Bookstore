# Generated by Django 4.0.5 on 2022-12-07 09:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('data', '0002_books_customer_rename_name_category_title_orders_and_more'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='books',
            options={'verbose_name_plural': 'Books'},
        ),
        migrations.AlterModelOptions(
            name='category',
            options={'verbose_name_plural': 'categories'},
        ),
        migrations.AlterModelOptions(
            name='orders',
            options={'verbose_name_plural': 'Orders'},
        ),
        migrations.RemoveField(
            model_name='books',
            name='price',
        ),
        migrations.AlterField(
            model_name='orders',
            name='status',
            field=models.CharField(choices=[('Accepted ', 'Accepted'), ('Packed ', 'Packed'), ('On the Way', 'On the Way'), ('Delivered', 'Delivered'), ('cancelled', 'cancelled')], max_length=200),
        ),
    ]