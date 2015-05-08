class KidsnamesController < ApplicationController
  # GET /kidsnames
  # GET /kidsnames.json
  def index
    @kidsnames = Kidsname.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kidsnames }
    end
  end

  # GET /kidsnames/1
  # GET /kidsnames/1.json
  def show
    @kidsname = Kidsname.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kidsname }
    end
  end

  # GET /kidsnames/new
  # GET /kidsnames/new.json
  def new
    @kidsname = Kidsname.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kidsname }
    end
  end

  # GET /kidsnames/1/edit
  def edit
    @kidsname = Kidsname.find(params[:id])
  end

  # POST /kidsnames
  # POST /kidsnames.json
  def create
    @kidsname = Kidsname.new(params[:kidsname])

    respond_to do |format|
      if @kidsname.save
        format.html { redirect_to @kidsname, notice: 'Kidsname was successfully created.' }
        format.json { render json: @kidsname, status: :created, location: @kidsname }
        @kidsname.count = 0
        @kidsname.score = 0
        @kidsname.save
      else
        format.html { render action: "new" }
        format.json { render json: @kidsname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kidsnames/1
  # PUT /kidsnames/1.json
  def update
    @kidsname = Kidsname.find(params[:id])

    respond_to do |format|
      if @kidsname.update_attributes(params[:kidsname])
        format.html { redirect_to @kidsname, notice: 'Kidsname was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kidsname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kidsnames/1
  # DELETE /kidsnames/1.json
  def destroy
    @kidsname = Kidsname.find(params[:id])
    @kidsname.destroy

    respond_to do |format|
      format.html { redirect_to kidsnames_url }
      format.json { head :no_content }
    end
  end


  def vote
  
    @names = Kidsname.where ['gender = \'f\' AND score >= ?', -99 ]
    @names = @names.shuffle  

    @names[0].count +=1
        @names[0].save

    @names[1].count +=1 
        @names[1].save 

    
    # @randomnames = @names[0,1]

    # @randomnames.each do |x|
     # x.count +=1
     # x.save

   # end
    
  end

    def voteboys
  
    @boysnames = Kidsname.where ['gender = \'m\' AND score >= ?', -99 ]
    @boysnames = @boysnames.shuffle 

    @boysnames[0].count +=1
        @boysnames[0].save

    @boysnames[1].count +=1 
        @boysnames[1].save 

    
    # @randomnames = @names[0,1]

    # @randomnames.each do |x|
     # x.count +=1
     # x.save

   # end
  end

  def voteresult
    @winner = Kidsname.find_by_id(params["winner"])
    @winner.score +=1
    @winner.save
      
    @names = Kidsname.where ['score >= ?', -99 ]

    @names.each do |x|
      if x.count >= 5 && x.score <= 2
       x.score = -100
       x.save

     elsif x.count == 4 && x.score == 0
       x.score = -100
       x.save

     elsif x.count >= 10 && x.score <=6
      x.score = -100
      x.save 
         
     elsif x.count >= 10 && x.count == x.score
      x.score +=5
      x.save

     elsif x.count >= 15 && x.score <= 8
      x.score = -100
      x.save

     elsif x.count >= 20 && x.score <= 12
      x.score = -100
      x.save

      end
    end

  end

  def top
    @topnames = Kidsname.where ['score == ?', count]
  end

  def out
    @outnames = Kidsname.where ['score <= ?', -450]
    @outnames = @outnames.shuffle
    @outnames.save

  end 

  def rmtakennames

  end

  def edit_multiple
    @editnames = Kidsname.find(params[:kidsname_ids])
  end
  
  def update_multiple
   @editnames = Kidsname.find(params[:kidsname_ids])

   @editnames.each do |name|
    name.update_attributes(:score => params[:score])
    name.save!

  end
  flash[:notice] = "Updated names!"
  redirect_to kidsnames_path
  end

#end
end