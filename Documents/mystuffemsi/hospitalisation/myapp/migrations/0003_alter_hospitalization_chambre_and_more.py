# Generated by Django 4.2.3 on 2023-07-30 21:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0002_hospitalization'),
    ]

    operations = [
        migrations.AlterField(
            model_name='hospitalization',
            name='chambre',
            field=models.PositiveIntegerField(),
        ),
        migrations.AlterField(
            model_name='hospitalization',
            name='contact_phone',
            field=models.PositiveIntegerField(),
        ),
        migrations.AlterField(
            model_name='hospitalization',
            name='entry_number',
            field=models.PositiveIntegerField(),
        ),
        migrations.AlterField(
            model_name='hospitalization',
            name='lit',
            field=models.PositiveIntegerField(),
        ),
        migrations.AlterField(
            model_name='hospitalization',
            name='telephone',
            field=models.PositiveIntegerField(),
        ),
    ]