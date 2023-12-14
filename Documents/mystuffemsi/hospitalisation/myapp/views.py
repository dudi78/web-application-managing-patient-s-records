from django.shortcuts import render

def home(request):
   # x={'name':'dounia','age':'21'}
    return render(request,'home.html')

def menu(request):
   # x={'name':'dounia','age':'21'}
    return render(request,'menu.html')

def dossier(request):
   # x={'name':'dounia','age':'21'}
    return render(request,'ajouterdossier.html')

def formch(request):
   # x={'name':'dounia','age':'21'}
    return render(request,'formchercher.html')


def chdossier(request,hid):
   
    hosp  = Hospitalization.objects.get(id=hid)
    context={'h': hosp}
    return render(request, 'chercherdossier.html',context)


from .forms import RegistrationForm
from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect

def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = RegistrationForm()
    return render(request, 'registration.html', {'form': form})

def  login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('menu')
        else:
            error_message = "Invalid username or password."
            return render(request, 'login.html', {'error_message': error_message})
    else:
        return render(request, 'login.html')
    
from .models import Hospitalization 
from .models import MyUser
from datetime import datetime
from django.shortcuts import render
from myapp.models import Hospitalization

def addhosp(request):
    if request.method == 'POST':
        # Get the date input from the form
        date_of_birth_string = request.POST.get('date_of_birth')
        date_of_entry_string = request.POST.get('date_of_entry')

        try:
            # Convert the date strings to datetime.date objects
            date_of_birth = datetime.strptime(date_of_birth_string, '%Y-%m-%d').date()
            date_of_entry = datetime.strptime(date_of_entry_string, '%Y-%m-%d').date()

            # Create an instance of Hospitalization and set the fields
            h = Hospitalization()
            h.service = request.POST.get('service')
            h.entry_number = request.POST.get('entry_number')
            h.chambre = request.POST.get('chambre')
            h.lit = request.POST.get('lit')
            h.first_name = request.POST.get('first_name')
            h.last_name = request.POST.get('last_name')
            h.cin_number = request.POST.get('cin_number')
            h.date_of_birth = date_of_birth  # Assign the parsed date
            h.sex = request.POST.get('sex')
            h.telephone = request.POST.get('telephone')
            h.address = request.POST.get('address')
            h.profession = request.POST.get('profession')
            h.marital_status = request.POST.get('marital_status')
            h.children_number = request.POST.get('children_number')
            h.emergency_contact = request.POST.get('emergency_contact')
            h.contact_address = request.POST.get('contact_address')
            h.contact_phone = request.POST.get('contact_phone')
            h.date_of_entry = date_of_entry  # Assign the parsed date
            h.save()

            # Redirect to a success page or do something else
            message = 'patient added successfully.'
            return render(request, 'menu.html',{'Hmessage': message})
        except ValueError:
            # Handle invalid date format error
            error_message = 'Invalid date format. Please use YYYY-MM-DD format.'
            return render(request, 'menu.html', {'Hmessage': error_message})

   

def Adds(request):
   ho =Hospitalization.objects.all()
   context={'hosp': ho}
     # Retrieve all  objects from the database
   return render(request, 'menu.html', context)


def details(request):
    cin_id = request.GET.get('cin')
    try:
        H = Hospitalization.objects.get(cin_number=cin_id)
    except Hospitalization.DoesNotExist:    
        H = None
    
    context = {'h': H}
    return render(request, 'menu.html', context)


def modifdossier(request, hid):
     if request.method == 'POST':
        # Get the date input from the form
        date_of_birth_string = request.POST.get('date_of_birth')
        date_of_entry_string = request.POST.get('date_of_entry')
        h = Hospitalization.objects.get(id=hid)
        try:
            # Convert the date strings to datetime.date objects
            date_of_birth = datetime.strptime(date_of_birth_string, '%Y-%m-%d').date()
            date_of_entry = datetime.strptime(date_of_entry_string, '%Y-%m-%d').date()
            
            h.service = request.POST.get('service')
            h.entry_number = request.POST.get('entry_number')
            h.chambre = request.POST.get('chambre')
            h.lit = request.POST.get('lit')
            h.first_name = request.POST.get('first_name')
            h.last_name = request.POST.get('last_name')
            h.cin_number = request.POST.get('cin_number')
            h.date_of_birth = date_of_birth  # Assign the parsed date
            h.sex = request.POST.get('sex')
            h.telephone = request.POST.get('telephone')
            h.address = request.POST.get('address')
            h.profession = request.POST.get('profession')
            h.marital_status = request.POST.get('marital_status')
            h.children_number = request.POST.get('children_number')
            h.emergency_contact = request.POST.get('emergency_contact')
            h.contact_address = request.POST.get('contact_address')
            h.contact_phone = request.POST.get('contact_phone')
            h.date_of_entry = date_of_entry  
            h.save()

            
            message = 'patient modified successfully.'
            return render(request, 'menu.html',{'gmessage': message})
        except ValueError:
            
            error_message = 'Invalid date format. Please use YYYY-MM-DD format.'
            return render(request, 'menu.html', {'message': error_message})
        

def delete_row(request,hid):
   
   
    Hospitalization.objects.get(id=hid).delete()
  
    message = 'patient deleted successfully.'
    return render(request, 'menu.html',{'dmessage': message})
from django.contrib.auth import logout


def logout_view(request):
    logout(request)
    return redirect('login')