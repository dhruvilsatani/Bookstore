# Generated by Django 4.0.5 on 2023-03-26 06:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('data', '0018_rename_customer_orders_customer_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Offer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(max_length=2000, upload_to='')),
            ],
            options={
                'verbose_name_plural': 'Offer',
            },
        ),
    ]
