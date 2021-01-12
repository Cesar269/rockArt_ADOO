function soloEnteros(e)
{
    var keynum;

    if (window.event)
    {
        keynum = e.keyCode;
    } else
    if (e.which)
    {
        keynum = e.which;
    }

    if ((keynum >= 48 && keynum <= 57) || keynum === 8)
    {
        return true;
    } else
        return false;

}