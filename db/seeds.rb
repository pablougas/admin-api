# <--- Start User Seed --->
User.destroy_all

User.create([
  {
    first_name: "pablo",
    last_name: "ugas",
    email: "pablo.ugas@gmail.com",
    phone: "5557890505"
  },
  {
    first_name: "kayce",
    last_name: "ugas",
    email: "kaycemarie@gmail.com",
    phone: "5559990505"
  }
])

# <--- End User Seed --->

# <--- Start Company Seed --->
Company.destroy_all

Company.create([
  {
    legal_name: "Tozmorov Fine Homes",
    phone: "2085559090",
  },
  {
    legal_name: "LH Custom Homes",
    phone: "2085550909",
  }
])
# <--- End Company Seed --->