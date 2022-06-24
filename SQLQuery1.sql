Create table tblImages
(
    Id int primary key identity,
    Name nvarchar(255),
    Size int,
    ImageData varbinary(max)
)


Go

Create procedure spUploadImage
@Name nvarchar(255),
@Size int,
@ImageData varbinary(max),
@NewId int output
as
Begin
    Insert into tblImages
    values (@Name, @Size, @ImageData)

    Select @NewId = SCOPE_IDENTITY()
End
Go


Create procedure spGetImageById
@Id int
as
Begin
    Select ImageData
    from tblImages where Id=@Id
End
Go