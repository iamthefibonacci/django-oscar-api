from django.apps import apps
from django.urls import include, path
from django.contrib import admin

from rest_framework_simplejwt.views import TokenRefreshView

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from rest_framework_simplejwt import views as jwt_views


urlpatterns = [
    path('i18n/', include('django.conf.urls.i18n')),
    path('admin/', admin.site.urls),
    path('logout/', include('oscarapi.urls')),
    path('api/', include('oscarapi.urls')),
    path('', include(apps.get_app_config('oscar').urls[0])),

    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('token', TokenObtainPairView.as_view(), name='token_obtain_pair'),
]
