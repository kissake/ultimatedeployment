function PushButton (MyButton)
{
    if ( MyButton.id == 'Apply' )
    {
      document.SYSTEMFORM.action.value="applyesx4nosan";
      document.SYSTEMFORM.submit();
    }
    if ( MyButton.id == 'Cancel' )
    {
      location.href = '?module=system&action=status';
    }
}

