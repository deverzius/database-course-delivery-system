from rest_framework import viewsets
from .models import Account, AccountSerializer
from rest_framework.decorators import action 
from rest_framework.response import Response

class AccountViewSet(viewsets.ModelViewSet):
    queryset = Account.objects.all()
    serializer_class = AccountSerializer
    
    @action(detail=False, methods=['GET', 'POST'], url_path='accounts')
    def get_account_list(self, request):
        if request.method == 'POST':
            return Response({
                "data": "Create account"
            })
        else:
            return Response({
                "data": Account.objects.all()
            })