# Generated by Django 4.0.5 on 2022-12-07 09:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('data', '0003_alter_books_options_alter_category_options_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='books',
            name='discounted_price',
            field=models.IntegerField(default=199),
        ),
        migrations.AddField(
            model_name='books',
            name='selling_price',
            field=models.IntegerField(default=200),
        ),
    ]