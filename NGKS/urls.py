from core import views
from django.contrib import admin
from django.conf.urls import url, include
from catalogo import views as views_catalogo
from django.contrib.auth.views import login, logout

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^contato/$', views.contato,name='contato'),
    url(r'^entrar/$', login,{'template_name':'login.html'},name='login'),
    url(r'^sair/$', logout,{'next_page':'index'},name='logout'),
    url(r'^compras/', include(('checkout.urls', 'checkout'), namespace='checkout')),
    url(r'^loja/', include(('catalogo.urls','catalogo'), namespace='catalogo')),
    url(r'^admin/', admin.site.urls),
    
]
